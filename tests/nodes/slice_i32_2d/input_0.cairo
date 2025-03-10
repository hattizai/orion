use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::I32Tensor;
use orion::numbers::{IntegerTrait, i32};

fn input_0() -> Tensor<i32> {
    let mut shape = ArrayTrait::<usize>::new();
    shape.append(2);
    shape.append(4);

    let mut data = ArrayTrait::new();
    data.append(i32 { mag: 1, sign: false });
    data.append(i32 { mag: 68, sign: true });
    data.append(i32 { mag: 4, sign: true });
    data.append(i32 { mag: 96, sign: false });
    data.append(i32 { mag: 55, sign: true });
    data.append(i32 { mag: 119, sign: true });
    data.append(i32 { mag: 12, sign: true });
    data.append(i32 { mag: 73, sign: false });
    TensorTrait::new(shape.span(), data.span())
}
