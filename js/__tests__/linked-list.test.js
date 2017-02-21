import LinkedList from '../src/linked-list';

test('Linked List count returns 0 with no data', () => {
  let linkedList = new LinkedList();
  expect(linkedList.count()).toBe(0);
});

test('Linked List count returns 1 when adding 1 datum', () => {
  let linkedList = new LinkedList();
  linkedList.add('foo');
  expect(linkedList.count()).toBe(1);
});

test('Linked List count returns 2 when adding 2 data', () => {
  let linkedList = new LinkedList();
  linkedList.add('foo');
  linkedList.add('bar');
  expect(linkedList.count()).toBe(2);
});
