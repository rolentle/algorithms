class DataNode {
  constructor(value) {
    this.value = value;
  }

  count() {
    if (this.child) {
      return this.child.count() + 1;
    }
    return 1;
  }

  push(data) {
    this.add(data);
  }


  add(data) {
    if (this.child) {
      this.child.add(data);
    } else {
      this.child = new DataNode(data);
    }
  }
}

export default DataNode;
