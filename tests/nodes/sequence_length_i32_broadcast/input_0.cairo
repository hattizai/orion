use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::I32Tensor;
use orion::numbers::{IntegerTrait, i32};

fn input_0() -> Array<Tensor<i32>> {
    let mut sequence = ArrayTrait::new();

    let mut shape = ArrayTrait::<usize>::new();
    shape.append(2);
    shape.append(3);

    let mut data = ArrayTrait::new();
    data.append(i32 { mag: 4, sign: false });
    data.append(i32 { mag: 2, sign: false });
    data.append(i32 { mag: 0, sign: false });
    data.append(i32 { mag: 6, sign: true });
    data.append(i32 { mag: 5, sign: true });
    data.append(i32 { mag: 1, sign: false });

    sequence.append(TensorTrait::new(shape.span(), data.span()));

    let mut shape = ArrayTrait::<usize>::new();
    shape.append(1);
    shape.append(3);

    let mut data = ArrayTrait::new();
    data.append(i32 { mag: 4, sign: true });
    data.append(i32 { mag: 3, sign: false });
    data.append(i32 { mag: 1, sign: true });

    sequence.append(TensorTrait::new(shape.span(), data.span()));

    let mut shape = ArrayTrait::<usize>::new();
    shape.append(3);
    shape.append(1);

    let mut data = ArrayTrait::new();
    data.append(i32 { mag: 5, sign: false });
    data.append(i32 { mag: 5, sign: true });
    data.append(i32 { mag: 6, sign: true });

    sequence.append(TensorTrait::new(shape.span(), data.span()));

    let mut shape = ArrayTrait::<usize>::new();
    shape.append(2);
    shape.append(1);

    let mut data = ArrayTrait::new();
    data.append(i32 { mag: 2, sign: false });
    data.append(i32 { mag: 5, sign: true });

    sequence.append(TensorTrait::new(shape.span(), data.span()));

    sequence
}
