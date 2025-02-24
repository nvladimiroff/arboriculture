require "test_helper"

class TestArboriculture < Minitest::Test

  def test_builder_happy_path
    actual = Arboriculture.build do
      div(:class => 'big') do
        text 'Hello'
        text 'world'
      end
    end

    expected = Arboriculture::Node.new(:div, [], {:class => 'big'},
      [
        Arboriculture::Node.new(:text, ['Hello'], {}, []),
        Arboriculture::Node.new(:text, ['world'], {}, [])
      ]
    )
    assert_equal(expected, actual)
  end


  def test_builder_with_var
    actual = Arboriculture.build(model: 0) do
      div do
        text @model
      end
    end

    expected = Arboriculture::Node.new(:div, [], {},
      [
        Arboriculture::Node.new(:text, [0], {}, [])
      ]
    )
    assert_equal(expected, actual)
  end



  def test_builder_with_string
    actual = Arboriculture.build(<<~RUBY)
      div do
        text 'Hello'
      end
    RUBY

    expected = Arboriculture::Node.new(:div, [], {},
      [
        Arboriculture::Node.new(:text, ['Hello'], {}, [])
      ]
    )
    assert_equal(expected, actual)
  end

end
