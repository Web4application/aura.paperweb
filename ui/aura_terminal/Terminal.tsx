import React, { useState } from "react";
import TerminalLine from "./TerminalLine";
import AuraInput from "../components/AuraInput";

export default function Terminal() {
  const [lines, setLines] = useState([]);

  function addLine(result) {
    setLines([...lines, result]);
  }

  return (
    <div className="aura-terminal">
      {lines.map((l, i) => (
        <TerminalLine key={i} data={l} />
      ))}
      <AuraInput onResult={addLine} />
    </div>
  );
}
