import DataNode from '../src/data-node';

test('DataNode has value', () => {
  const value = 'foo';
  const node = new DataNode(value);
  expect(node.value).toBe(value);
});

test('DataNode without a child has count of 1', () => {
  const value = 'foo';
  const node = new DataNode(value);
  expect(node.count()).toBe(1);
});

test('DataNode with child has count of 2', () => {
  const value = 'foo';
  const node = new DataNode(value);
  node.add('bar');
  expect(node.count()).toBe(2);
});
