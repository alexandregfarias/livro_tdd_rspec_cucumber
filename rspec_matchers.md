# Matchers relacionados a truthy e falsy
- > expect(obj).to be_truthy [ passa se obj != de nil e false ]
- > expect(obj).to be_falsey [ O teste passa se obj é falsy (nil ou false) ]
- > expect(obj).to be_nil [ passa se obj é nil ]
- > expect(obj).to be [ passa se obj é truthy (não nil e não false) ]

# Matchers de Equidade
- > expect(a).to eq(b) [ espera-se que a == b ]
- > expect(a).to be(b) [ espera-se que a seja o mesmo objeto que b]
- > expect(a).to eql(b) [ passa quando a e b possuem o mesmo hash code ]

# Matchers relacionados a Array
- > expect(array).to match_array( [ 1, 2, 3, 4 ] ) - > Verifica se um array é igual ao outro independente da ordem dos elementos.
- > expect(array).not_to match_array( [ 1, 2, 3, 4 ] )
- > expect(array).to include(1, 2, 3, 4) - > Verifica se o array contém os elementos passados no parâmetro
- > expect(array).to include(1)
- > expect(array).not_to include(5)
- > expect(array).not_to include(5, 6, 7, 8)
- > expect(array).not_to include([1, 2, 3, 4])
- > array = [1, 2, 3, 4]
- > expect(array).to start_with(1)
- > expect(array).to start_with(1, 2)
- > expect(array).not_to start_with(2)
- > expect(array).to end_with(4)
- > expect(array).to end_with(3, 4)
- > expect(array).not_to end_with(3)