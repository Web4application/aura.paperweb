export const xlmathEngine = {
  namespace: ".xlmath",

  execute(query: string) {
    return {
      engine: "xlmath",
      result: `Math engine received: ${query}`,
      steps: ["parse expression", "evaluate AST", "return result"],
    };
  },
};
