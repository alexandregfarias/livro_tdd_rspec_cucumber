RSpec.describe "Matchers" do
    context 'matchers lógicos' do
        it 'quando a é truthy' do
            a = true
            expect(a).to be_truthy
        end

        it 'quand a é falsey' do
            a = false
            expect(a).to be_falsey
        end
    end

    context 'matchers de equidade' do
        it 'quando conteúdo de string a = conteúdo de string b' do
            a = "olá, mundo"
            b = "olá, mundo"      
            expect(a).to eq(b)    
            expect(a).to eql(b)
        end

        it 'quando a e b possuem o mesmo hashcode' do
            a = "olá, mundo"
            b = a      
            expect(a).to be(b)    
        end
    end

    context 'matchers relacionados a arrays' do            
        array_a = [1, 2, 3, 4]
        it 'quando os arrays possuem elementos iguais' do
            array_b = [2, 3, 1, 4]
            expect(array_a).to match_array(array_b)
            expect(array_a).to match_array([4, 3, 2, 1])
        end

        it 'quando elementos passados no parâmetro existem no array' do
            expect(array_a).to include(1, 2)
            expect(array_a).to include(1, 2, 3, 4)
            expect(array_a).to_not include(5)
        end

        it 'quando um array começa ou termina com um elemento' do
            expect(array_a).to start_with(1)
            expect(array_a).to end_with(4)
        end
    end

    context 'matchers relacionados a hashes' do
        hash = {a: 7, b: 5}
        it 'quando o hash possui a chave informada' do            
            expect(hash).to include(:a, :b)
        end
        
        it 'quando o hash possui a chave e valor informados' do
            expect(hash).to include(a: 7)
            expect(hash).to include(b: 5)
        end
    end

    context 'matchers relacionados a strings' do
        uma_string = "Alexandre Farias"

        it 'verifica String de acordo com uma expressão regular' do
            expect(uma_string).to match(/Alexandre/)
            expect(uma_string).to match(/Farias/)            
        end

        it 'verifica inclusão dentro de uma String' do
            expect(uma_string).to include("A")
            expect(uma_string).to include("Alexandre Farias")
            expect(uma_string).to include("lexa")
            expect(uma_string).to include("e Fa")
            expect(uma_string).to_not include("eFa")
        end

        it 'verifica se uma String começa ou termina com um determinado valor' do
            expect(uma_string).to start_with("A")
            expect(uma_string).to start_with("Alexandre")
            expect(uma_string).to end_with("s")
            expect(uma_string).to end_with("Farias")
        end
    end

    context 'predicate matchers' do
        it 'verifica se um objeto está vazio' do
            carro = Carro.new
            carro.esvaziar_atributos
            expect(carro.status).to be_empty
            expect(carro.velocidade).to be_nil
            expect(carro.hash).to have_key(:a).and have_value(7)
            expect(carro.hash).to have_key(:b)
        end
    end

    context 'matcher para exception' do
        it 'verifica se um erro foi lançado' do
            expect{ 1/0 }.to raise_error(ZeroDivisionError)
            expect{ 1/0 }.to raise_error("divided by 0")
            expect{ 1/0 }.to raise_error(ZeroDivisionError, "divided by 0")
            expect{ 1/0 }.to raise_exception(ZeroDivisionError)
            expect{ raise RuntimeError }.to raise_error(RuntimeError)
        end
    end
end

class Carro
    attr_accessor :status, :velocidade, :hash

    def initialize
        @status = "desligado"
        @velocidade = 0
    end

    def esvaziar_atributos
        @status = []
        @velocidade = nil
    end

    def hash
        @hash = {a: 7, b: 5}
    end
end

class Game
    attr_accessor :state, :level
    def initialize
        @state = :initial
        @level = 0
    end

    def start
        @state = :started        
    end

    def next_level
        @level += 1
    end
end


RSpec.describe Game do
    describe "#start" do
        it 'change game stage from initial to started' do
            game = Game.new
            expect {
                game.start
            }.to change {game.state}.from(:initial).to(:started)
        end

        it 'increments game level' do
            game = Game.new
            expect {
                game.next_level
            }.to change {game.level}.from(game.level).to(game.level + 1)
        end
    end
end