use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::FP16x16Tensor;
use orion::numbers::FixedTrait;
use orion::numbers::FP16x16;

fn input_0() -> Tensor<FP16x16> {
    let mut shape = ArrayTrait::<usize>::new();
    shape.append(2);
    shape.append(2);

    let mut data = ArrayTrait::new();
    data.append(FP16x16 { mag: 60947, sign: true });
    data.append(FP16x16 { mag: 18316, sign: true });
    data.append(FP16x16 { mag: 60057, sign: false });
    data.append(FP16x16 { mag: 56869, sign: true });
    TensorTrait::new(shape.span(), data.span())
}
