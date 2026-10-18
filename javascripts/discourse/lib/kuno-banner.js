// Same item for everyone on a given UTC day; tomorrow moves one step through the pool.
export function today() {
  return Math.floor(Date.now() / 86_400_000);
}

export function pickForDay(items, day) {
  return items.length ? items[day % items.length] : null;
}

// The URLs come from an admin setting but still land in an href, so anything that
// isn't an absolute https URL (javascript:, typos, relative paths) is dropped.
export function supportedKunos(setting) {
  return (setting || "")
    .split("|")
    .map((value) => value.trim())
    .filter((value) => {
      try {
        return new URL(value).protocol === "https:";
      } catch {
        return false;
      }
    });
}
