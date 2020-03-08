const type = {
  Caret: "Caret",
  Range: "Range"
};

const checkNode = targetNode => {
  const noeds = [];

  while (targetNode.nodeName != "DIV") {
    noeds.push(targetNode.nodeName);
    targetNode = targetNode.parentNode;
  }

  return noeds;
};

const getTags = focusNode => {
  return checkNode(focusNode.parentNode).join();
};

document.addEventListener("selectionchange", () => {
  const focusNode = document.getSelection().focusNode;
  if (focusNode) {
    selectionChannel.postMessage(getTags(focusNode));
  }
});
