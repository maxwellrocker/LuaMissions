function test_variables_are_defined_locally_with_local()
  local x = 'a local value'
  assert_equal('a local value', x)
end

function local_variables_are_not_available_outside_the_scope_where_they_were_defined()
  assert_equal(nil, x)
end

function test_global_variables_are_defined_without_local()
  y = 'a global value'
  assert_equal('a global value', y)
end

function test_global_variables_are_available_outside_the_scope_where_they_were_defined()
  assert_equal('a global value', y)
end

-- Note: don't use global variables unless it's really necesary. Try not to forget using local

function test_nil_is_the_default_value_of_uninitialized_variables()
  local foo
  assert_equal(true, foo == nil)
end

function test_local_variables_inside_do_end_are_invisible_outside()
  do
    local foo = 'foo'
    assert_equal('foo', foo)
  end
  assert_equal(nil, foo)
end

function test_multiple_assignment_with_commas()
  local a,b,c = 1,2,3
  assert_equal(2, b)
end

function test_switching_variables()
  local a,b = 1,2
  a,b = b,a
  assert_equal(1, b)
end

function test_nil_type()
  assert_equal('nil', type(nil))
end

function test_number_type()
  assert_equal('number', type(10))
  assert_equal('number', type(0))
  assert_equal('number', type(3.1415927))
  assert_equal('number', type(-10))
  assert_equal('number', type(1.2345e6))
  -- we'll see more about numbers in numbers.lua
end

function test_string_type()
  assert_equal('string', type("hello"))
  assert_equal('string', type('hello'))
  assert_equal('string', type([[hello]]))
  -- learn more about strings in strings.lua
end

function test_boolean_type()
  assert_equal('boolean', type(true))
  assert_equal('boolean', type(false))
end

function test_table_type()
  assert_equal('table', type({})) -- 
  -- there's lots to be learnt about tables in tables.lua
end

function test_function_type()
  assert_equal('function', type(assert_equal)) -- assert_equal *is* a function
  assert_equal('function', type(type)) -- and so is type
end

function test_thread_type()
  assert_equal('thread', type(coroutine.create(function() end)))
  -- we'll probably not learn about coroutines in our missions.
end

-- There is another type, called 'userdata', reserved for objects that interact with C
-- These are the objects that make embedding possible
