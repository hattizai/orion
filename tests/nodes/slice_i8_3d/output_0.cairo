use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::I8Tensor;
use orion::numbers::{IntegerTrait, i8};

fn output_0() -> Tensor<i8> {
    let mut shape = ArrayTrait::<usize>::new();
    shape.append(3);
    shape.append(4);
    shape.append(5);

    let mut data = ArrayTrait::new();
    data.append(i8 { mag: 86, sign: false });
    data.append(i8 { mag: 106, sign: true });
    data.append(i8 { mag: 30, sign: true });
    data.append(i8 { mag: 89, sign: true });
    data.append(i8 { mag: 48, sign: false });
    data.append(i8 { mag: 72, sign: false });
    data.append(i8 { mag: 120, sign: true });
    data.append(i8 { mag: 29, sign: false });
    data.append(i8 { mag: 79, sign: false });
    data.append(i8 { mag: 46, sign: false });
    data.append(i8 { mag: 101, sign: true });
    data.append(i8 { mag: 87, sign: true });
    data.append(i8 { mag: 37, sign: true });
    data.append(i8 { mag: 5, sign: true });
    data.append(i8 { mag: 72, sign: true });
    data.append(i8 { mag: 64, sign: false });
    data.append(i8 { mag: 71, sign: true });
    data.append(i8 { mag: 53, sign: false });
    data.append(i8 { mag: 111, sign: true });
    data.append(i8 { mag: 4, sign: false });
    data.append(i8 { mag: 99, sign: true });
    data.append(i8 { mag: 104, sign: true });
    data.append(i8 { mag: 106, sign: true });
    data.append(i8 { mag: 59, sign: true });
    data.append(i8 { mag: 121, sign: true });
    data.append(i8 { mag: 69, sign: true });
    data.append(i8 { mag: 64, sign: false });
    data.append(i8 { mag: 42, sign: false });
    data.append(i8 { mag: 30, sign: true });
    data.append(i8 { mag: 82, sign: true });
    data.append(i8 { mag: 53, sign: false });
    data.append(i8 { mag: 55, sign: true });
    data.append(i8 { mag: 13, sign: true });
    data.append(i8 { mag: 112, sign: true });
    data.append(i8 { mag: 113, sign: false });
    data.append(i8 { mag: 0, sign: false });
    data.append(i8 { mag: 66, sign: true });
    data.append(i8 { mag: 31, sign: true });
    data.append(i8 { mag: 50, sign: false });
    data.append(i8 { mag: 70, sign: false });
    data.append(i8 { mag: 110, sign: true });
    data.append(i8 { mag: 114, sign: false });
    data.append(i8 { mag: 72, sign: false });
    data.append(i8 { mag: 21, sign: true });
    data.append(i8 { mag: 79, sign: true });
    data.append(i8 { mag: 46, sign: false });
    data.append(i8 { mag: 30, sign: true });
    data.append(i8 { mag: 34, sign: true });
    data.append(i8 { mag: 76, sign: true });
    data.append(i8 { mag: 64, sign: true });
    data.append(i8 { mag: 75, sign: true });
    data.append(i8 { mag: 111, sign: false });
    data.append(i8 { mag: 80, sign: false });
    data.append(i8 { mag: 31, sign: true });
    data.append(i8 { mag: 5, sign: true });
    data.append(i8 { mag: 76, sign: false });
    data.append(i8 { mag: 60, sign: false });
    data.append(i8 { mag: 111, sign: true });
    data.append(i8 { mag: 40, sign: true });
    data.append(i8 { mag: 30, sign: true });
    TensorTrait::new(shape.span(), data.span())
}
