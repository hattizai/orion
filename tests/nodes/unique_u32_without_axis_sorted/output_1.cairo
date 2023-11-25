use array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::I32Tensor;
use orion::numbers::{IntegerTrait, i32};

fn output_1() -> Tensor<i32> {
    let mut shape = ArrayTrait::<usize>::new();
    shape.append(13);

    let mut data = ArrayTrait::new();
    data.append(i32 { mag: 17, sign: false });
    data.append(i32 { mag: 26, sign: false });
    data.append(i32 { mag: 11, sign: false });
    data.append(i32 { mag: 15, sign: false });
    data.append(i32 { mag: 0, sign: false });
    data.append(i32 { mag: 14, sign: false });
    data.append(i32 { mag: 1, sign: false });
    data.append(i32 { mag: 4, sign: false });
    data.append(i32 { mag: 18, sign: false });
    data.append(i32 { mag: 2, sign: false });
    data.append(i32 { mag: 6, sign: false });
    data.append(i32 { mag: 12, sign: false });
    data.append(i32 { mag: 25, sign: false });
    TensorTrait::new(shape.span(), data.span())
}
