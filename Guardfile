guard 'minitest' do
  watch( %r|^test/(.*)\/?(.*)_test\.rb| )
  watch( %r|^lib/(.*)([^/]+)\.rb|       ){ |m| "test/#{m[1]}#{m[2]}_test.rb" }
  watch( 'test/test_helper.rb'          ){ 'test' }
  watch( 'Gemfile.lock'                 ){ 'test' }
end
