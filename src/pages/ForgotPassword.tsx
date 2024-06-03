import { useState, useRef } from "react";
import { Link } from "react-router-dom";
import ForgotPassword from "../features/user/ForgotPassword";
import Login from "../features/user/Login";

const ExternalPage = () => {
  return (
    <div className="">
      <ForgotPassword />
    </div>
  );
};

export default ExternalPage;
