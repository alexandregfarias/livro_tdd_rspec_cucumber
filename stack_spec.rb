class Stack
    def initialize
        @elements = []
    end

    def push(element)
        @elements << element
    end

    def top
        @elements.last
    end
end

RSpec.describe Stack do
    describe "#push" do
        it "puts an element at the top of the stack" do
            stack = Stack.new
            stack.push(1)
            stack.push(2)
            expect(stack.top).to eq(2)
        end
    end
end

# A estrutura de uma expectation segue o seguinte padrão:
# expect(atual).to matcher(esperado).
# - > Espera-se que (valor do topo do stack).seja igual a 2.

