import LinkedList from '../src/linked-list';

test('Linked List count returns 0 with no data', () => {
  let linkedList = new LinkedList();
  expect(linkedList.count()).toBe(0);
});
