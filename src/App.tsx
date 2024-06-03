import { lazy, useEffect } from "react";
import "./App.css";
import {
  BrowserRouter as Router,
  Route,
  Routes,
  Navigate,
} from "react-router-dom";
import { themeChange } from "theme-change";
const Login = lazy(() => import("./pages/Login"));
const ForgotPassword = lazy(() => import("./pages/ForgotPassword"));
const Register = lazy(() => import("./pages/Login"));

function App() {
  useEffect(() => {
    themeChange(false);
  }, []);
  return (
    <>
      <Router>
        <Routes>
          <Route path="/" element={<Navigate to="/login" />} />
          <Route path="/login" element={<Login />} />
          <Route path="/forget-password" element={<ForgotPassword />} />
          <Route path="/register" element={<Register />} />
        </Routes>
      </Router>
    </>
  );
}

export default App;
