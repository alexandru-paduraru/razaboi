#define BUILDING_NODE_EXTENSION
#include <node.h>

using namespace v8;

Handle<Value> Add(const Arguments& args) {
  HandleScope scope;

  Handle<Array> array = Array::New(3);

  array->Set(0, Integer::New(2));
  array->Set(1, Integer::New(3));
  array->Set(2, Integer::New(4));

  // Return the value through Close.
  return scope.Close(array);
}

void Init(Handle<Object> exports) {
  exports->Set(String::NewSymbol("add"),
      FunctionTemplate::New(Add)->GetFunction());
}


NODE_MODULE(addon, Init)
