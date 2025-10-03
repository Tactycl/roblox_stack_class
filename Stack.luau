--!strict
export type Stack = {
	stack: {any},
	map: {[any]: number},
	clear_function: ((any) -> (boolean))?,

	new: () -> (Stack),
	Push: (self: Stack, value: any) -> (number),
	Pop: (self: Stack) -> (any),
	Remove: (self: Stack, index: number) -> (any),
	Peek: (self: Stack) -> (any),
	IsEmpty: (self: Stack) -> (boolean),
	Size: (self: Stack) -> (number),
	ToTable: (self: Stack) -> ({any}),
	Get: (self: Stack, i: number) -> (any),
	Clear: (self: Stack) -> (),
	Clone: (self: Stack) -> (Stack),
	Contains: (self: Stack, value: any) -> (boolean),
	SetClearFunction: (self: Stack, callback: (any) -> (boolean)) -> (),
	RemoveClearFunction: (self: Stack) -> (),
	Destroy: (self: Stack) -> (),
}

local Stack = {}
Stack.__index = Stack

function Stack.new(): Stack
	local self = (setmetatable({}, Stack):: unknown):: Stack

	self.stack = {}
	self.map = {}
	self.clear_function = nil

	return self
end

function Stack:Push(value: any): number
	table.insert(self.stack, value)
	self.map[value] = #self.stack
	return #self.stack
end

function Stack:Pop(): any
	return self:Remove(#self.stack)
end

function Stack:Remove(index: number): any
	if self:IsEmpty() then
		return
	end

	local item = table.remove(self.stack, index)
	self.map[item] = nil

	if self.clear_function then
		local success, v = pcall(self.clear_function, item)
		if not success then
			warn("[Stack] failed to execute clear function, error: " .. v)

		elseif not v then
			warn("[Stack] custom clear function failed")
		end
	end

	return item
end

function Stack:Peek(): any
	return self.stack[#self.stack]
end

function Stack:IsEmpty(): boolean
	return self:Size() == 0
end

function Stack:Size(): number
	return #self.stack
end

function Stack:ToTable(): {any}
	return table.clone(self.stack)
end

function Stack:Get(i: number): any
	return self.stack[i]
end

function Stack:Clear()
	if self.clear_function then
		for i = #self.stack, 1, -1 do
			local item = self.stack[i]
			local success, v = pcall(self.clear_function, item)
			if not success then
				warn("[Stack] failed to execute clear function, error: " .. v)

			elseif not v then
				warn("[Stack] custom clear function failed")
			end
		end
	end

	table.clear(self.stack)
	table.clear(self.map)
end

function Stack:Clone(): Stack
	local newStack: Stack = Stack.new()
	for _, item in self.stack do
		newStack:Push(item)
	end
	return newStack
end

function Stack:Contains(value: any): boolean
	return self.map[value] ~= nil
end

function Stack:SetClearFunction(callback: (any) -> (boolean))
	self.clear_function = callback
end

function Stack:RemoveClearFunction()
	self.clear_function = nil
end

function Stack:Destroy()
	table.clear(self)
end

return Stack
