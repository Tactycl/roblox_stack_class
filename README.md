# Roblox Stack Class  

The **Stack Class** is a versatile utility for Roblox, useful for implementing **Undo/Redo systems, UI traversal**, or other Last-In-First-Out (LIFO) operations. It provides a clear API to manage stack data structures efficiently with optional custom cleanup logic.  

---

## Key Benefits  
- Easy-to-use Stack implementation for Roblox projects.  
- Supports custom clear functions for safe resource management.  
- Provides cloning and conversion utilities for flexibility.  

---

## API Reference  

### Constructor  
- **`.new(): Stack`**  
  Creates a new Stack object.  

---

### Basic Stack Operations  
- **`:Push(value: any): number`**  
  Pushes a new item onto the stack. Returns the new stack size.  

- **`:Pop(): any`**  
  Removes and returns the newest item on the stack.  

- **`:Remove(index: number): any`**  
  Removes and returns the item at the specified index.  

- **`:Peek(): any`**  
  Returns the newest item without removing it.  

- **`:IsEmpty(): boolean`**  
  Returns `true` if the stack has no items.  

- **`:Size(): number`**  
  Returns the current number of items in the stack.  

- **`:ToTable(): {any}`**  
  Returns a shallow copy of the stack as a table.  

- **`:Get(i: number): any`**  
  Retrieves the item at the specified index.  

- **`:Clear()`**  
  Clears all items from the stack.  

- **`:Clone(): Stack`**  
  Creates a new Stack object with all items copied from the current stack.  

- **`:Contains(value: any): boolean`**  
  Returns `true` if the value exists in the stack.  

---

### Advanced Features  
- **`:SetClearFunction(callback: (any) -> (boolean))`**  
  Sets a custom clear function, invoked inside `:Remove` and `:Pop`. Should return a boolean indicating success.  

- **`:RemoveClearFunction()`**  
  Removes the custom clear function.  

- **`:Destroy()`**  
  Clears and destroys the stack object completely.  

---

## Example Usage  

```lua
local Stack = require(path.to.Stack)
local history = Stack.new()

-- Push values
history:Push("Step 1")
history:Push("Step 2")

-- Peek at the top value
print(history:Peek()) -- Step 2

-- Pop value
local last = history:Pop()
print(last) -- Step 2

-- Check size
print(history:Size()) -- 1

-- Clone stack
local copy = history:Clone()

-- Set a custom clear function
history:SetClearFunction(function(item)
    print("Clearing item:", item)
    return true
end)

-- Remove an item with clear function
history:Remove(1)

history:Destroy()
```
