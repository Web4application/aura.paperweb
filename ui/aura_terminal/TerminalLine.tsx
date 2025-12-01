export default function TerminalLine({ data }) {
  return (
    <div className="aura-terminal-line">
      <strong>{data.engine.toUpperCase()}</strong> → {data.result}
    </div>
  );
}
