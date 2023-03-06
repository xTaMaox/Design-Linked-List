class Node {
    let val: Int
    var next: Node?

    init(_ val: Int) {
        self.val = val
    }
}

class MyLinkedList {

    private var head: Node?

    init() {}
    
    func get(_ index: Int) -> Int {
        var current = head
        var i = 0
        while i < index {
            current = current?.next
            i += 1
        }
        
        return current?.val ?? -1
    }
    
    func addAtHead(_ val: Int) {
        guard head != nil else {
            head = Node(val)
            return
        }

        let new = Node(val)
        let old = head
        head = new
        new.next = old
    }
    
    func addAtTail(_ val: Int) {
        guard head != nil else {
            head = Node(val)
            return
        }

        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = Node(val)
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        guard index > 0 else {
            addAtHead(val)
            return
        }

        var previous = head
        var i = 0
        while i < index - 1 {
            previous = previous?.next
            i += 1
        }

        guard previous != nil else { return }

        let new = Node(val)
        let old = previous?.next
        previous?.next = new
        new.next = old
    }
    
    func deleteAtIndex(_ index: Int) {
        guard index > 0 else {
            head = head?.next
            return
        }

        var previous = head
        var i = 0
        while i < index - 1 {
            previous = previous?.next
            i += 1
        }

        guard previous != nil else { return }
        previous?.next = previous?.next?.next
    }
}
