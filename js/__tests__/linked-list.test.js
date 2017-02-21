import Node from '../src/linked-list';

test('Node class exists', () => {
  let value = 'foo';
  let node =  new Node(value);
  expect(node.value).toBe(value);
});
