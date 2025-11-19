import React, { useEffect, useState } from "react";
import axios from "axios";
import { Button, Typography, Box } from "@mui/material";

function Wallet() {
  const [balance, setBalance] = useState(0);

  const fetchBalance = async () => {
    const token = localStorage.getItem("token");
    let res = await axios.get(import.meta.env.VITE_API_URL + "/wallet", { headers: { Authorization: `Bearer ${token}` } });
    setBalance(res.data.balance);
  };

  useEffect(() => { fetchBalance(); }, []);

  const deposit = async () => {
    const token = localStorage.getItem("token");
    let amt = window.prompt("Enter amount to deposit:");
    let res = await axios.post(import.meta.env.VITE_API_URL + "/wallet/deposit", { amount: Number(amt) }, { headers: { Authorization: `Bearer ${token}` } });
    setBalance(res.data.balance);
  };

  return (
    <Box>
      <Typography variant="h6">Wallet Balance: ${balance}</Typography>
      <Button variant="contained" onClick={deposit}>Deposit Money</Button>
    </Box>
  );
}

export default Wallet;
