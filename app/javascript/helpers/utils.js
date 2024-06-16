export function reorderElements(arr, oldIndex, newIndex) {
  if (
    oldIndex < 0 ||
    newIndex < 0 ||
    oldIndex >= arr.length ||
    newIndex >= arr.length
  ) {
    throw new Error("Index out of bounds");
  }
  if (oldIndex === newIndex) {
    return arr;
  }
  const temp = arr.splice(oldIndex, 1);
  arr.splice(newIndex, 0, ...temp);
  return arr;
}

export function getCookie(name) {
  const value = `; ${document.cookie}`;
  const parts = value.split(`; ${name}=`);
  if (parts.length === 2) {
    return parts.pop().split(";").shift();
  }
  return null;
}
