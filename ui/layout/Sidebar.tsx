import React from "react";

export default function Sidebar() {
  const items = [
    "Workspace",
    "Math Lab",
    "Code Lab",
    "Data Lab",
    "Quantum Lab",
    "AI Engine",
  ];

  return (
    <div className="aura-sidebar">
      <h2>AURA</h2>
      {items.map((i) => (
        <button key={i} className="sidebar-item">{i}</button>
      ))}
    </div>
  );
}
