### Bitcoin Core Guix Build with NixOS

General device requirements: [Bitcoin Guix requirements](https://github.com/bitcoin/bitcoin/tree/master/contrib/guix#requirements)

Others
- git



**1. Setup**

```bash
cd ~
mkdir -p guix-builds/Xcode_15
cd guix-builds
git clone https://github.com/bitcoin/bitcoin.git
cd bitcoin
git checkout v30.0rc1
cd ..
````


**2. Required flakes and system configuration**

In `configuration.nix`, add these packages to `environment.systemPackages`:

```nix
environment.systemPackages = with pkgs; [
  guix
  xar
  pbzx
  cpio
  rcodesign
  gnumake42
];
```

Enable the Guix service in `configuration.nix`:

```nix
services.guix.enable = true;
```

Then rebuild using

```bash
sudo nixos-rebuild switch
```

or depending on your setup

```
just switch
```


**3. Create an Apple Developer account**

[Apple Developer](https://developer.apple.com/)



**4. Download Xcode 15**

[Download Xcode 15.xip](https://download.developer.apple.com/Developer_Tools/Xcode_15/Xcode_15.xip)


**5. Move or copy Xcode 15 to `guix-builds/Xcode_15`**
    
Local machine to server copy can easily be done using `rsync`:

```bash
rsync -azP ~/Downloads/Xcode_15.xip user@server:/home/user/guix-builds/Xcode_15/
```
Delete local copy if desired:

```bash
unlink ~/Downloads/Xcode_15.xip
```



**6. Extract and prepare Xcode SDK**

```bash
cd ~/guix-builds/Xcode_15

xar -xf Xcode_15.xip
rm -rf Xcode_15.xip

pbzx -n Content | cpio -i
rm Content Metadata

rcodesign verify Xcode.app/Contents/MacOS/Xcode

nix-store --add-fixed --recursive sha256 Xcode.app
rm -rf Xcode.app
```


**7. Generate the SDK tarball**

```bash
cd ~/guix-builds/bitcoin
./contrib/macdeploy/gen-sdk ~/guix-builds/Xcode_15/Xcode.app

mv Xcode-15.0-15A240d-extracted-SDK-with-libcxx-headers.tar.gz ~/guix-builds/Xcode_15/
cd ~/guix-builds/Xcode_15
```



**8. Verify SHA256 hash**

```bash
sha256sum Xcode-15.0-15A240d-extracted-SDK-with-libcxx-headers.tar.gz
```

Expected output example:

```
c0c2e7bb92c1fee0c4e9f3a485e4530786732d6dd9e9f418c282aa6892f55d  Xcode-15.0-15A240d-extracted-SDK-with-libcxx-headers.tar.gz
```



**9. Extract the SDK**

```bash
tar -C ./ -xaf Xcode-15.0-15A240d-extracted-SDK-with-libcxx-headers.tar.gz
ls
```


**10. Add the SDK path to Nix configuration**

```nix
environment.variables = {
  SDK_PATH = "/home/user/guix-builds/Xcode_15/";
};
```

Then rebuild:

```bash
sudo nixos-rebuild switch
```

or depending on your setup

```
just switch
```


**11. Handle `SOURCE_DATE_EPOCH`**

Unset it to avoid conflicts with Nix and Guix builds:

```bash
unset SOURCE_DATE_EPOCH
```



**12. Run the build**

```bash
cd ~/guix-builds/bitcoin
./contrib/guix/guix-build
```

**13. Codesign and attest the build output**
[Official Intructions](https://github.com/bitcoin/bitcoin/tree/master/contrib/guix#codesigning-build-outputs)
