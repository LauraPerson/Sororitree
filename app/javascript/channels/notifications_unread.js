import consumer from "./consumer";

const initNotifications = () => {
  const unreadContainer = document.querySelector('messages_unread');
  if (unreadContainer) {
    const id = unreadContainer.dataset.id;

    consumer.subscriptions.create({ channel: "NotificationsChannel", id: id }, {
      received(data) {
        unreadContainer.innerHTML(data);
      },
    });
  }
}

export { initNotifications };