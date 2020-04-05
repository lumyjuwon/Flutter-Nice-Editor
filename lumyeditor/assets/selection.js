const type = {
  Caret: "Caret",
  Range: "Range",
};

const checkNode = (targetNode) => {
  const noeds = [];

  console.log(targetNode);

  while (targetNode.nodeName != "DIV") {
    noeds.push(targetNode.nodeName);
    targetNode = targetNode.parentNode;
  }

  return noeds;
};

const getAttributions = (focusNode) => {
  return checkNode(focusNode).join();
};

document.addEventListener("selectionchange", () => {
  const focusNode = document.getSelection().focusNode;

  if (focusNode) {
    selectionChannel.postMessage(getAttributions(focusNode));
  }
});
