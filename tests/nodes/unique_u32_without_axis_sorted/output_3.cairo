use array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::I32Tensor;
use orion::numbers::{IntegerTrait, i32};

fn output_3() -> Tensor<i32> {
    let mut shape = ArrayTrait::<usize>::new();
    shape.append(12);

    let mut data = ArrayTrait::new();
    data.append(i32 { mag: 3, sign: false });
    data.append(i32 { mag: 3, sign: false });
    data.append(i32 { mag: 2, sign: false });
    data.append(i32 { mag: 2, sign: false });
    data.append(i32 { mag: 1, sign: false });
    data.append(i32 { mag: 1, sign: false });
    data.append(i32 { mag: 8, sign: false });
    data.append(i32 { mag: 1, sign: false });
    data.append(i32 { mag: 1, sign: false });
    data.append(i32 { mag: 1, sign: false });
    data.append(i32 { mag: 3, sign: false });
    data.append(i32 { mag: 1, sign: false });
    TensorTrait::new(shape.span(), data.span())
}
