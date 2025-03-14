use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::I8Tensor;
use orion::numbers::{IntegerTrait, i8};

fn input_0() -> Array<Tensor<i8>> {
    let mut sequence = ArrayTrait::new();

    let mut shape = ArrayTrait::<usize>::new();
    shape.append(3);
    shape.append(3);

    let mut data = ArrayTrait::new();
    data.append(i8 { mag: 6, sign: true });
    data.append(i8 { mag: 3, sign: false });
    data.append(i8 { mag: 6, sign: true });
    data.append(i8 { mag: 5, sign: false });
    data.append(i8 { mag: 4, sign: false });
    data.append(i8 { mag: 2, sign: true });
    data.append(i8 { mag: 0, sign: false });
    data.append(i8 { mag: 3, sign: false });
    data.append(i8 { mag: 4, sign: false });

    sequence.append(TensorTrait::new(shape.span(), data.span()));

    let mut shape = ArrayTrait::<usize>::new();
    shape.append(1);
    shape.append(1);

    let mut data = ArrayTrait::new();
    data.append(i8 { mag: 3, sign: false });

    sequence.append(TensorTrait::new(shape.span(), data.span()));

    let mut shape = ArrayTrait::<usize>::new();
    shape.append(3);
    shape.append(3);

    let mut data = ArrayTrait::new();
    data.append(i8 { mag: 4, sign: true });
    data.append(i8 { mag: 5, sign: true });
    data.append(i8 { mag: 1, sign: false });
    data.append(i8 { mag: 4, sign: true });
    data.append(i8 { mag: 4, sign: true });
    data.append(i8 { mag: 1, sign: true });
    data.append(i8 { mag: 4, sign: true });
    data.append(i8 { mag: 5, sign: false });
    data.append(i8 { mag: 6, sign: true });

    sequence.append(TensorTrait::new(shape.span(), data.span()));

    let mut shape = ArrayTrait::<usize>::new();
    shape.append(1);
    shape.append(1);

    let mut data = ArrayTrait::new();
    data.append(i8 { mag: 4, sign: false });

    sequence.append(TensorTrait::new(shape.span(), data.span()));

    sequence
}
