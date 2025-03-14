use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::I8Tensor;
use orion::numbers::{IntegerTrait, i8};

fn output_0() -> Tensor<i8> {
    let mut shape = ArrayTrait::<usize>::new();
    shape.append(1);
    shape.append(15);

    let mut data = ArrayTrait::new();
    data.append(i8 { mag: 2, sign: false });
    data.append(i8 { mag: 4, sign: false });
    data.append(i8 { mag: 4, sign: true });
    data.append(i8 { mag: 3, sign: false });
    data.append(i8 { mag: 3, sign: false });
    data.append(i8 { mag: 2, sign: false });
    data.append(i8 { mag: 3, sign: false });
    data.append(i8 { mag: 3, sign: false });
    data.append(i8 { mag: 1, sign: false });
    data.append(i8 { mag: 0, sign: false });
    data.append(i8 { mag: 4, sign: false });
    data.append(i8 { mag: 4, sign: true });
    data.append(i8 { mag: 1, sign: true });
    data.append(i8 { mag: 4, sign: false });
    data.append(i8 { mag: 5, sign: true });
    TensorTrait::new(shape.span(), data.span())
}
