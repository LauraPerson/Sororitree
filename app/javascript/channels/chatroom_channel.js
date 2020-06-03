import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('chat-container');
//   messagesContainer.scrollblabla = messagesContainer.scrollHeight;

//   if (firstTime) {
//   messagescontainer.scrollTop = messagesContainer.scrollHeight;
//   firstTime = false;
// } else if (messagesContainer.scrollTop + messagesContainer.clientHeight === messagesContainer.scrollHeight) {
//   messagesContainer.scrollTop = messagesontainer.scrollHeight;
// }
console.log("broadcast_received")

  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data)
      },
    });
  }
}



export { initChatroomCable };
