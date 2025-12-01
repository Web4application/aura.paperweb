import { routeQuery } from "./aura_router";

export async function runAura(query: string) {
  const engine = routeQuery(query);

  if (engine.error) {
    return { error: engine.error };
  }

  return engine.execute(query);
}
