# Roblox Stack Class

A simple Stack class for Roblox useful for things like Undo/Redo systems or a UI Traversal system

# API

.new(), returns (Stack) -> Returns a new Stack Object<br/>
:Push(value: any), returns (number) -> Pushes a new item on the Stack, returns new stack size<br/>
:Pop(), returns (any) -> Removes newest item on the Stack, returns said item<br/>
:Remove(index: number), returns (any) -> Removes item from Stack specified with the index in the array, returns said item<br/>
:Peek(), returns (any) -> Same as :Pop, but doesn't remove item from Stack<br/>
:IsEmpty(), returns (boolean) -> Returns true if nothing is on Stack, otherwise falsse<br/>
:Size(), returns (number) -> Returns count of items on Stack<br/>
:ToTable(), returns ({any}) -> Returns a shallow copy of the current Stack<br/>
:Get(i: number), returns (any) -> Gets item from Stack specified with the index in the array<br/>
:Clear(), returns none -> Clears current Stack<br/>
:Clone(), returns (Stack) -> Creates a new Stack Object and pushes all items from the Stack onto the new one<br/>
:Contains(value: any), returns (boolean) -> Returns wether or not the item is contained inside the Stack<br/>
:SetClearFunction(callback: (any) -> (boolean)), returns none -> Sets a clear function, this clear function is called inside of :Remove and :Pop, clear function should return wether or not it succeeded or not via a boolean, no return counts as failure<br/>
:RemoveClearFunction(), returns none -> Removes the clear function and it won't be called later on<br/>
:Destroy(), returns none -> Destroys & Clears Stack Object<br/>
