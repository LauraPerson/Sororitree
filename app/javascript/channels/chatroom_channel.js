import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('chat-container ');

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
