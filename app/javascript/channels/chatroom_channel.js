import consumer from "./consumer";

const scrollLastMessageIntoView = () => {
  const messages = document.querySelectorAll('.message-container');
  const lastMessage = messages[messages.length - 1];
  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }
}

const initChatroomCable = () => {
  const messagesContainer = document.querySelector("#chat-container");
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        scrollLastMessageIntoView();
      },
    });
  }
}



export { initChatroomCable, scrollLastMessageIntoView };


