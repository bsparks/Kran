require '../src/main'

describe 'component', ->
  comp = null

  it 'is be possible to add components', ->
    comp = component.new( ->
      this.bar = 17
    )

  it 'stores all components and their constructor function', ->
    func1 = () -> this.x = 1
    func2 = () -> this.y = 2

    comp2 = component.new(func1)
    comp3 = component.new(func2)

    component[comp2].should.equal func1
    component[comp3].should.equal func2

  it 'sould delegate incrementing ids to component', ->
    comp.should.equal 0
    comp2.should.equal 1
    comp3.should.equal 2

  it 'can be instantiated', ->
    foo = new component[comp]()
    foo.bar.should.equal 17