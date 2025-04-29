# Polkafi

## Meet the Team!
Ehu Shubham Shaw, Tyler Rosa

## About the Project
We are building a decentralized gap financing platform that enables real-world businesses — including real estate developers, SMEs, startups, and contract holders — to raise capital from retail and institutional investors globally.

Borrowers can raise funds through two options:
- Debt Financing (stable interest payments)
- Tokenized Equity Offerings (ownership upside)

Powered by Polkadot's cross-chain capabilities, our platform ensures capital aggregation from multiple blockchains, payout in stablecoins, and transparent, milestone-based fund disbursements.

## How It Works
- Borrowers request funding via debt or tokenized equity.
- Investors fund projects using assets from multiple chains.
- Platform aggregates funds into stablecoins (USDC, aUSD).
- Smart contracts manage milestone disbursements, interest repayments, and equity distributions.

## Smart Contract Overview
- Intended to use Polkadot Asset Hub
- Key Functions:
  - fundProject(): Investors fund the borrower's project.
  - payoutBorrower(): Funds released to borrowers upon milestone completion.
  - repayLoan(): Borrower repays principal + interest.
  - claimInterest(): Investors claim interest payouts.


## Frontend Overview
- Built using *React.js*
- Wallet integration: *Polkadot.js Wallet* and *Metamask* (for EVM assets)
- Displays available projects, investment flows, borrower status, and repayment dashboards.

## Demo Video
(https://we.tl/t-6BZC1Hz1Bo)

## UI Screenshots
| Page                         | Screenshot |
|-------------------------------|------------|
| Investor Dashboard           | ![Investor Dashboard](![image](https://github.com/user-attachments/assets/f205f82d-a255-44c2-b0f0-a0338324b6c9)) |
| Borrower Application Portal  | ![Borrower Portal](![image](https://github.com/user-attachments/assets/e4659cca-3e51-4d50-8ee5-3f44c4bf1c11)) |
| Milestone Tracking Interface | ![Milestone Tracker](![image](https://github.com/user-attachments/assets/27be810a-686c-4735-adbc-d55faef99d02)) |


## Repo Structure
/contracts - Smart contracts in Ink!
/frontend - React app
/scripts - Deployment scripts for Asset Hub
/readme-assets - Demo video and screenshots


## Deployment Details
Contract deployed to Polkadot Asset Hub
Block Explorer link: (https://moonbase.moonscan.io/address/0xcBB143822176058A864ed9583f56360D51317579)


## Our Big Setback

We successfully deployed the smart contract; however, we encountered persistent issues with the faucet. The faucet repeatedly returned an "out of funds" error, preventing us from obtaining DEV tokens needed for testing. Despite having funds sent directly to a key we could use, the balance continued to show 0 DEV.

We attempted several workarounds, including using different devices, IP addresses, and network connections, but none fixed the issue. Additionally, the faucet’s 24-hour cooldown period significantly delayed our progress, and we did not have the time available to wait between attempts.

Due to these challenges, we decided to run the application locally with a setup that closely mirrors the intended deployment. This allowed us to move forward with testing and running the application as planned, despite the issues with the faucet.

![image](https://github.com/user-attachments/assets/7341b3f1-fa8f-4f28-8f3d-7d1c635a2436)
