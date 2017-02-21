import Node from '../src/linked-list';

test('Node has value', () => {
  let value = 'foo';
  let node =  new Node(value);
  expect(node.value).toBe(value);
});
