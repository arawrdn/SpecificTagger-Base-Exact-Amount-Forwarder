# 🎯 Specific Tagger Forwarder (Base Network)

This repository documents the **SpecificTagger** smart contract deployed on the Base network. This contract is designed to process **only transfers of a specific, exact ETH amount** ($0.000001$ ETH). Upon successful transfer, the sender's address is publicly recorded, and the funds are **instantly forwarded** to the owner's wallet.

## 🔗 Project Details

| Parameter | Value |
| :--- | :--- |
| **Contract Name** | `SpecificTagger` (Exact Amount Forwarder) |
| **Owner Address (Deployer)** | `0x2A6b5204B83C7619c90c4EB6b5365AA0b7d912F7` |
| **Deployed Contract Address (CA)** | **`0x5eFCD610937f41E5127834304E994DFE43AAD616`** |
| **Required Transfer Amount** | **EXACTLY $0.000001$ ETH** |
| **BaseScan Link** | [https://basescan.org/address/0x5eFCD610937f41E5544834304E994DFE43AAD616](https://basescan.org/address/0x5eFCD610937f41E5127834304E994DFE43AAD616) |

---

## 🛠️ Deployment and Verification Settings

The contract was deployed using **Remix IDE**. For successful source code verification on BaseScan, these exact compiler settings were utilized:

| Setting | Value |
| :--- | :--- |
| **Solidity Version** | `0.8.30` |
| **Optimizer Enabled** | **Yes** |
| **Optimizer Runs** | `200` |
| **Constructor Arguments** | None (Empty) |

---

## 💡 User Interaction Guide (Transfer-Only)

The contract uses the `receive()` function. Users **only need to perform a standard ETH transfer** to the Contract Address. The transfer will only succeed if the amount is **EXACTLY $0.000001$ ETH**.

### Steps for Participants

1.  **Open Wallet:** Open any wallet connected to the Base network.
2.  **Recipient:** Paste the **Contract Address (CA)** into the recipient field.
3.  **Amount (CRITICAL):** Input the amount **EXACTLY** as **$0.000001$ ETH**.
    * *Note: Any deviation (more or less) will cause the transaction to fail and revert.*
4.  **Confirm:** Confirm the transaction.

### Automated Contract Results

Upon successful transfer:

1.  **Tagging:** The user's address is recorded in the public `taggedUsers` array.
2.  **Forwarding:** The funds are **INSTANTLY** transferred from the Contract Address to the **Owner Address** (`0x2A6b...`) as an **Internal Transaction**.

---

## 🔎 Owner Monitoring Instructions

As the funds are forwarded automatically, the Owner's primary task is data monitoring. **No clicks are required to receive funds.**

### Owner Actions (Passive & Active)

| Action | Description | Frequency |
| :--- | :--- | :--- |
| **Receiving Funds** | **PASSIVE.** Funds are received automatically in the Owner's wallet. | Instantaneous |
| **Checking Data** | **ACTIVE.** Visit the BaseScan link, navigate to the **Contract** tab, and use **Read Contract** to verify participants. | Anytime |

To check the number of successful participants, call the **`getTaggedUserCount()`** function on BaseScan.

---

## 📄 Source Code

The Solidity source code for the `SpecificTagger.sol` contract is available in the `contracts/` directory of this repository.

## 📜 License

This project is licensed under the **MIT License**.
