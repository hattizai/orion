use array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::U32Tensor;

fn output_0() -> Tensor<u32> {
    let mut shape = ArrayTrait::<usize>::new();
    shape.append(3);
    shape.append(3);
    shape.append(3);

    let mut data = ArrayTrait::new();
    data.append(11);
    data.append(5);
    data.append(12);
    data.append(6);
    data.append(2);
    data.append(13);
    data.append(14);
    data.append(14);
    data.append(14);
    data.append(3);
    data.append(0);
    data.append(6);
    data.append(1);
    data.append(7);
    data.append(13);
    data.append(3);
    data.append(7);
    data.append(5);
    data.append(0);
    data.append(13);
    data.append(5);
    data.append(0);
    data.append(14);
    data.append(3);
    data.append(13);
    data.append(7);
    data.append(6);
    TensorTrait::new(shape.span(), data.span())
}
