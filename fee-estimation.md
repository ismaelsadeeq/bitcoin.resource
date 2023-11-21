## Initial Fee Estimator Design

- [Gist](https://gist.github.com/gavinandresen/6548612)
- [Chaincode Fee Estimation Video](https://www.youtube.com/watch?v=PYA1f2xlIOM&pp=ygUYY2hhaW5jb2RlIGZlZSBlc3RpbWF0aW9u)

## Reworking of Fee Estimator (Using Buckets)

- [Mailing List Post](https://www.mail-archive.com/bitcoin-development@lists.sourceforge.net/msg06405.html)
- [GitHub Pull Request](https://github.com/bitcoin/bitcoin/pull/5159)

### Stop Creating 0 Fee Rate Transactions

- [GitHub Pull Request](https://github.com/bitcoin/bitcoin/pull/7022)

## John Newberry on Bitcoin Core Fee Estimation

- [An Intro to Bitcoin Core Fee Estimation](https://johnnewbery.com/an-intro-to-bitcoin-core-fee-estimation/)
- [What's New in Bitcoin Core v0.15 Pt.2](https://johnnewbery.com/whats-new-in-bitcoin-core-v0.15-pt2/)

## High-Level Design of the Updated Fee Estimator

- [Gist](https://gist.github.com/morcos/d3637f015bc4e607e1fd10d8351e9f41)
- [Better Fee Estimates](https://github.com/bitcoin/bitcoin/pull/10199)

## Current PR's on Fee Estimation

- [Detect and Ignore Transactions That Were CPFP'd in the Fee Estimator](https://github.com/bitcoin/bitcoin/pull/25380)
    - Connected to: [Package-Aware Fee Estimation](https://github.com/bitcoin/bitcoin/pull/23074)

- [Fee Estimator Updates from Validation Interface/Cscheduler Thread](https://github.com/bitcoin/bitcoin/pull/28368)
    - Connected to: [Move Fee Estimator into Validationinterface/Cscheduler Thread](https://github.com/bitcoin/bitcoin/pull/11775)

### Interesting Closed PR's

**Concept ACK but Approach NACK**
- [Switch to Weight Units for All Feerates Computation](https://github.com/bitcoin/bitcoin/pull/17566)
- [Attempted Mempool-Based Fee Estimation](https://github.com/bitcoin/bitcoin/pull/12966)
- [Add fee_est Tool for Debugging Fee Estimation Code](https://github.com/bitcoin/bitcoin/pull/10443)

**No Concept ACK**
- [Policy, Refactor: CFeeRate::FromSatB/FromBtcKb Named Constructors](https://github.com/bitcoin/bitcoin/pull/20790)

**Weak Concept ACK**
- [Allow Fee Estimation to Work with Lower Fees](https://github.com/bitcoin/bitcoin/pull/13990)
    - Connected to: [Lower Default Relay Fees](https://github.com/bitcoin/bitcoin/pull/13922)

### Issues on Fee stimation

- [Improving fee estimation accurracy](https://github.com/bitcoin/bitcoin/issues/27995)

- [Bitcoin is returning higher fees for 36 block window than 2 block window (on testnet)](https://github.com/bitcoin/bitcoin/issues/11800)