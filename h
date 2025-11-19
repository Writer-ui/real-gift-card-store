import React, { useState } from "react";
import axios from "axios";
import { Button, TextField, Typography, Box } from "@mui/material";

function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const loginEmail = async () => {
    try {
      let res = await axios.post(import.meta.env.VITE_API_URL + "/login", { email, password });
      localStorage.setItem("token", res.data.token);
      alert("Logged in!");
    } catch (e) {
      alert("Invalid credentials.");
    }
  };

  const googleLogin = () => {
    window.location.href = import.meta.env.VITE_API_URL + "/auth/google";
  };

  return (
    <Box>
      <Typography variant="h6">Login with Email</Typography>
      <TextField label="Email" value={email} onChange={e => setEmail(e.target.value)} /><br/>
      <TextField label="Password" type="password" value={password} onChange={e => setPassword(e.target.value)} /><br/>
      <Button variant="contained" onClick={loginEmail}>Login</Button>
      <hr/>
      <Typography variant="h6">Or sign in with Google</Typography>
      <Button variant="contained" color="primary" onClick={googleLogin}>Google Sign-In</Button>
    </Box>
  );
}

export default Login;
