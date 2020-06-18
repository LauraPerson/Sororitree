import consumer from "./consumer";

const scrollLastMessageIntoView = () => {
  const messages = document.querySelectorAll('.message-container');
  const lastMessage = messages[messages.length - 1];
  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  };
};

const initChatroomCable = () => {
  const messagesContainer = document.querySelector("#chat-container");
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        data = JSON.parse(data)
        const guestNickname = document.querySelector('.chat-title').innerText;
        if (guestNickname === data.senderNickname) {
          messagesContainer.insertAdjacentHTML('beforeend', data.message);
          scrollLastMessageIntoView();
        };
      },
    });
  };
};



export { initChatroomCable, scrollLastMessageIntoView };


