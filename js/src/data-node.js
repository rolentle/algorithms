class DataNode {
  constructor(value) {
    this.value = value;
  }

  count() {
    if (this.child) {
      return this.child.count() + 1
    } else {
      return 1;
    };
  }

  add(data) {
    this.child = new DataNode(data);
  }
};

export default DataNode;
