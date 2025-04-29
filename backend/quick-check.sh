#!/usr/bin/env bash
# ─── quick-check.sh  (chmod +x quick-check.sh ; ./quick-check.sh) ──────────────
set -e

export API="http://localhost:4000/api"
export BORROWER="0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266"
export  INVESTOR="0x70997970c51812dc3a010c7d01b50e0d17dc79c8"

echo "1️⃣  CREATE listing"
curl -s -X POST "$API/listings" -H 'Content-Type: application/json'
{
  "loanId": 999,
  "borrower": "$BORROWER",
  "principal": "1000000000000000000",   /* 1 ETH */
  "startBps": 1200,
  "minBps": 400,
  "maturity": $(( $(date +%s) + 864000 ))  
} | jq
echo -e "\n"

echo "2️⃣  LIST all"
curl -s "$API/listings" | jq
echo -e "\n"

echo "3️⃣  FUND 0.2 ETH"
curl -s -X POST "$API/fund" -H 'Content-Type: application/json' -d @- <<EOF | jq
{ "loanId": 999, "investor": "$INVESTOR", "amount": "200000000000000000", "useUSDC": false }
EOF
echo -e "\n"

echo "4️⃣  FUND 50 USDC"
curl -s -X POST "$API/fund" -H 'Content-Type: application/json' -d @- <<EOF | jq
{ "loanId": 999, "investor": "$INVESTOR", "amount": "50000000000000000000", "useUSDC": true }
EOF
echo -e "\n"

echo "5️⃣  REPAY (borrower pays ETH, mocked via backend console or manual Tx)"
echo "    ──> run this in Hardhat console:"
cat <<'NODE'
const Gap = await ethers.getContractAt("GapLoan", process.env.CONTRACT_ADDRESS);
await Gap.connect(await ethers.getSigner(BORROWER))
        .repay(999, { value: ethers.parseEther("1.12") });   // principal + decayed interest
NODE
echo

read -p "Press ENTER after you’ve executed repay() …"

echo "6️⃣  WITHDRAW"
curl -s -X POST "$API/withdraw" -H 'Content-Type: application/json' -d @- <<EOF | jq
{ "loanId": 999, "investor": "$INVESTOR" }
EOF
echo -e "\n✅  all endpoints hit successfully!"