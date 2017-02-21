import DataNode from '../src/data-node';

test('DataNode has value', () => {
  let value = 'foo';
  let node =  new DataNode(value);
  expect(node.value).toBe(value);
});
