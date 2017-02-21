import DataNode from './data-node';

class LinkedList {
  count() {
    if (this.head) {
      return this.head.count();
    } else {
      return 0;
    }
  }

  push(data) {
    add(data);
  }

  add(data) {
    if (this.head) {
      this.head.add(data);
    } else {
      this.head = new DataNode(data);
    }
  }
};

export default LinkedList;
