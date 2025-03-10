use core::array::ArrayTrait;
use core::array::SpanTrait;
use core::option::OptionTrait;
use core::traits::{TryInto, Into};

use orion::numbers::fixed_point::core::FixedTrait;
use orion::operators::tensor::helpers::SpanPartialOrd;
use orion::operators::tensor::core::{
    new_tensor, constant_of_shape, stride, Tensor, TensorTrait, ravel_index, unravel_index, reshape,
    at_tensor,
};
use orion::operators::tensor::{math, linalg, quantization, core as core_tensor, ml, manipulation};
use orion::numbers::{i8, i32, NumberTrait, FP64x64, FP64x64Impl};
use orion::numbers::fixed_point::implementations::fp64x64::core::ONE;
use orion::operators::tensor::implementations::{
    tensor_i8::I8Tensor, tensor_u32::U32Tensor, tensor_bool::BoolTensor
};

impl FP64x64Tensor of TensorTrait<FP64x64> {
    fn new(shape: Span<usize>, data: Span<FP64x64>) -> Tensor<FP64x64> {
        new_tensor(shape, data)
    }

    fn constant_of_shape(shape: Span<usize>, value: FP64x64) -> Tensor<FP64x64> {
        constant_of_shape(shape, value)
    }

    fn at(self: @Tensor<FP64x64>, indices: Span<usize>) -> FP64x64 {
        *at_tensor(self, indices)
    }

    fn add(lhs: Tensor<FP64x64>, rhs: Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::arithmetic::add(@lhs, @rhs)
    }

    fn sub(lhs: Tensor<FP64x64>, rhs: Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::arithmetic::sub(@lhs, @rhs)
    }

    fn mul(lhs: Tensor<FP64x64>, rhs: Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::arithmetic::mul(@lhs, @rhs)
    }

    fn div(lhs: Tensor<FP64x64>, rhs: Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::arithmetic::div(@lhs, @rhs)
    }

    fn min_in_tensor(self: @Tensor<FP64x64>) -> FP64x64 {
        math::min_in_tensor::min_in_tensor::<FP64x64, u128>(*self.data)
    }

    fn min(tensors: Span<Tensor<FP64x64>>) -> Tensor<FP64x64> {
        math::min::min(tensors)
    }

    fn max_in_tensor(self: @Tensor<FP64x64>) -> FP64x64 {
        math::max_in_tensor::max_in_tensor(*self.data)
    }

    fn max(tensors: Span<Tensor<FP64x64>>) -> Tensor<FP64x64> {
        math::max::max(tensors)
    }

    fn stride(self: @Tensor<FP64x64>) -> Span<usize> {
        stride(*self.shape)
    }

    fn ravel_index(self: @Tensor<FP64x64>, indices: Span<usize>) -> usize {
        ravel_index(*self.shape, indices)
    }

    fn unravel_index(self: @Tensor<FP64x64>, index: usize) -> Span<usize> {
        unravel_index(index, *self.shape)
    }

    fn reshape(self: @Tensor<FP64x64>, target_shape: Span<usize>) -> Tensor<FP64x64> {
        reshape(self, target_shape)
    }

    fn reduce_sum(self: @Tensor<FP64x64>, axis: usize, keepdims: bool) -> Tensor<FP64x64> {
        math::reduce_sum::reduce_sum(self, axis, keepdims)
    }

    fn reduce_prod(self: @Tensor<FP64x64>, axis: usize, keepdims: bool) -> Tensor<FP64x64> {
        math::reduce_prod::reduce_prod(self, axis, keepdims)
    }

    fn argmax(
        self: @Tensor<FP64x64>, axis: usize, keepdims: Option<bool>, select_last_index: Option<bool>
    ) -> Tensor<usize> {
        math::argmax::argmax(self, axis, keepdims, select_last_index)
    }

    fn argmin(
        self: @Tensor<FP64x64>, axis: usize, keepdims: Option<bool>, select_last_index: Option<bool>
    ) -> Tensor<usize> {
        math::argmin::argmin(self, axis, keepdims, select_last_index)
    }

    fn transpose(self: @Tensor<FP64x64>, axes: Span<usize>) -> Tensor<FP64x64> {
        linalg::transpose::transpose(self, axes)
    }

    fn matmul(self: @Tensor<FP64x64>, other: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        linalg::matmul::matmul(self, other)
    }

    fn exp(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::exp::exp(*self)
    }

    fn log(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::log::log(*self)
    }

    fn equal(self: @Tensor<FP64x64>, other: @Tensor<FP64x64>) -> Tensor<usize> {
        math::equal::equal(self, other)
    }

    fn greater(self: @Tensor<FP64x64>, other: @Tensor<FP64x64>) -> Tensor<usize> {
        math::greater::greater(self, other)
    }

    fn greater_equal(self: @Tensor<FP64x64>, other: @Tensor<FP64x64>) -> Tensor<usize> {
        math::greater_equal::greater_equal(self, other)
    }

    fn less(self: @Tensor<FP64x64>, other: @Tensor<FP64x64>) -> Tensor<usize> {
        math::less::less(self, other)
    }

    fn less_equal(self: @Tensor<FP64x64>, other: @Tensor<FP64x64>) -> Tensor<usize> {
        math::less_equal::less_equal(self, other)
    }

    fn abs(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::abs::abs(*self)
    }

    fn neg(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::neg::neg(*self)
    }

    fn ceil(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::ceil::ceil(*self)
    }

    fn sin(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::sin::sin(*self)
    }

    fn cos(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::cos::cos(*self)
    }

    fn asin(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::asin::asin(*self)
    }

    fn cumsum(
        self: @Tensor<FP64x64>, axis: usize, exclusive: Option<bool>, reverse: Option<bool>
    ) -> Tensor<FP64x64> {
        math::cumsum::cumsum(self, axis, exclusive, reverse)
    }

    fn flatten(self: @Tensor<FP64x64>, axis: usize) -> Tensor<FP64x64> {
        math::flatten::flatten(self, axis)
    }

    fn sinh(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::sinh::sinh(*self)
    }

    fn tanh(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::tanh::tanh(*self)
    }

    fn cosh(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::cosh::cosh(*self)
    }

    fn acosh(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::acosh::acosh(*self)
    }

    fn asinh(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::asinh::asinh(*self)
    }

    fn atan(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::atan::atan(*self)
    }

    fn xor(self: @Tensor<FP64x64>, other: @Tensor<FP64x64>) -> Tensor<usize> {
        math::xor::xor(self, other)
    }

    fn or(self: @Tensor<FP64x64>, other: @Tensor<FP64x64>) -> Tensor<usize> {
        math::or::or(self, other)
    }

    fn acos(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::acos::acos(*self)
    }

    fn onehot(
        self: @Tensor<FP64x64>, depth: usize, axis: Option<usize>, values: Span<usize>
    ) -> Tensor<FP64x64> {
        math::onehot::onehot(self, depth, axis, values)
    }

    fn sqrt(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::sqrt::sqrt(*self)
    }

    fn concat(tensors: Span<Tensor<FP64x64>>, axis: usize,) -> Tensor<FP64x64> {
        math::concat::concat(tensors, axis)
    }

    fn quantize_linear(
        self: @Tensor<FP64x64>, y_scale: @Tensor<FP64x64>, y_zero_point: @Tensor<FP64x64>
    ) -> Tensor::<i8> {
        quantization::quantize_linear::quantize_linear(
            self,
            y_scale,
            y_zero_point,
            NumberTrait::new_unscaled(128, true),
            NumberTrait::new_unscaled(127, false)
        )
    }

    fn dequantize_linear(
        self: @Tensor<i8>, x_scale: @Tensor<FP64x64>, x_zero_point: @Tensor<FP64x64>
    ) -> Tensor::<FP64x64> {
        quantization::dequantize_linear::dequantize_linear(self, x_scale, x_zero_point)
    }

    fn qlinear_add(
        self: @Tensor<i8>,
        a_scale: @Tensor<FP64x64>,
        a_zero_point: @Tensor<FP64x64>,
        b: @Tensor<i8>,
        b_scale: @Tensor<FP64x64>,
        b_zero_point: @Tensor<FP64x64>,
        y_scale: @Tensor<FP64x64>,
        y_zero_point: @Tensor<FP64x64>
    ) -> Tensor::<i8> {
        quantization::qlinear_add::qlinear_add(
            self,
            a_scale,
            a_zero_point,
            b,
            b_scale,
            b_zero_point,
            y_scale,
            y_zero_point,
            NumberTrait::new_unscaled(128, true),
            NumberTrait::new_unscaled(127, false)
        )
    }

    fn qlinear_mul(
        self: @Tensor<i8>,
        a_scale: @Tensor<FP64x64>,
        a_zero_point: @Tensor<FP64x64>,
        b: @Tensor<i8>,
        b_scale: @Tensor<FP64x64>,
        b_zero_point: @Tensor<FP64x64>,
        y_scale: @Tensor<FP64x64>,
        y_zero_point: @Tensor<FP64x64>
    ) -> Tensor::<i8> {
        quantization::qlinear_mul::qlinear_mul(
            self,
            a_scale,
            a_zero_point,
            b,
            b_scale,
            b_zero_point,
            y_scale,
            y_zero_point,
            NumberTrait::new_unscaled(128, true),
            NumberTrait::new_unscaled(127, false)
        )
    }

    fn qlinear_matmul(
        self: @Tensor<i8>,
        a_scale: @Tensor<FP64x64>,
        a_zero_point: @Tensor<FP64x64>,
        b: @Tensor<i8>,
        b_scale: @Tensor<FP64x64>,
        b_zero_point: @Tensor<FP64x64>,
        y_scale: @Tensor<FP64x64>,
        y_zero_point: @Tensor<FP64x64>
    ) -> Tensor::<i8> {
        quantization::qlinear_matmul::qlinear_matmul(
            self,
            a_scale,
            a_zero_point,
            b,
            b_scale,
            b_zero_point,
            y_scale,
            y_zero_point,
            NumberTrait::new_unscaled(128, true),
            NumberTrait::new_unscaled(127, false)
        )
    }

    fn qlinear_concat(
        tensors: Span<Tensor<i8>>,
        scales: Span<Tensor<FP64x64>>,
        zero_points: Span<Tensor<FP64x64>>,
        y_scale: @Tensor<FP64x64>,
        y_zero_point: @Tensor<FP64x64>,
        axis: usize
    ) -> Tensor::<i8> {
        quantization::qlinear_concat::qlinear_concat(
            tensors,
            scales,
            zero_points,
            y_scale,
            y_zero_point,
            axis,
            NumberTrait::new_unscaled(128, true),
            NumberTrait::new_unscaled(127, false)
        )
    }

    fn qlinear_leakyrelu(
        self: @Tensor<i8>, a_scale: @Tensor<FP64x64>, a_zero_point: @Tensor<FP64x64>, alpha: FP64x64
    ) -> Tensor::<i8> {
        quantization::qlinear_leakyrelu::qlinear_leakyrelu(
            self,
            a_scale,
            a_zero_point,
            alpha,
            NumberTrait::new_unscaled(128, true),
            NumberTrait::new_unscaled(127, false)
        )
    }

    fn slice(
        self: @Tensor<FP64x64>,
        starts: Span<usize>,
        ends: Span<usize>,
        axes: Option<Span<usize>>,
        steps: Option<Span<usize>>
    ) -> Tensor<FP64x64> {
        core_tensor::slice::<FP64x64>(self, starts, ends, axes, steps)
    }

    fn gather(
        self: @Tensor<FP64x64>, indices: Tensor<usize>, axis: Option<usize>
    ) -> Tensor<FP64x64> {
        math::gather::gather(self, indices, axis)
    }

    fn nonzero(self: @Tensor<FP64x64>) -> Tensor<usize> {
        core_tensor::nonzero(self)
    }

    fn squeeze(self: @Tensor<FP64x64>, axes: Option<Span<i32>>) -> Tensor<FP64x64> {
        core_tensor::squeeze(self, axes)
    }

    fn unsqueeze(self: @Tensor<FP64x64>, axes: Span<usize>) -> Tensor<FP64x64> {
        core_tensor::unsqueeze(self, axes)
    }

    fn sign(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::sign::sign(*self)
    }

    fn clip(self: @Tensor<FP64x64>, min: Option<FP64x64>, max: Option<FP64x64>) -> Tensor<FP64x64> {
        core_tensor::clip(self, min, max)
    }

    fn and(self: @Tensor<bool>, other: @Tensor<bool>) -> Tensor<bool> {
        math::and::and(self, other)
    }

    fn identity(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        core_tensor::identity(self)
    }

    fn where(self: @Tensor<FP64x64>, x: @Tensor<FP64x64>, y: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::where::where(self, x, y)
    }

    fn bitwise_and(self: @Tensor<FP64x64>, other: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::bitwise_and::bitwise_and(self, other)
    }

    fn bitwise_xor(self: @Tensor<FP64x64>, other: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::bitwise_xor::bitwise_xor(self, other)
    }

    fn bitwise_or(self: @Tensor<FP64x64>, other: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::bitwise_or::bitwise_or(self, other)
    }

    fn round(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::round::round(*self)
    }

    fn reduce_l1(self: @Tensor<FP64x64>, axis: usize, keepdims: bool) -> Tensor<FP64x64> {
        math::reduce_l1::reduce_l1(self, axis, keepdims)
    }

    fn array_feature_extractor(self: @Tensor<FP64x64>, indices: Tensor<usize>) -> Tensor<FP64x64> {
        ml::array_feature_extractor::array_feature_extractor(*self, indices)
    }

    fn binarizer(self: @Tensor<FP64x64>, threshold: Option<FP64x64>) -> Tensor<FP64x64> {
        math::binarizer::binarizer(*self, threshold)
    }

    fn reduce_sum_square(self: @Tensor<FP64x64>, axis: usize, keepdims: bool) -> Tensor<FP64x64> {
        math::reduce_sum_square::reduce_sum_square(self, axis, keepdims)
    }

    fn reduce_l2(self: @Tensor<FP64x64>, axis: usize, keepdims: bool) -> Tensor<FP64x64> {
        math::reduce_l2::reduce_l2(self, axis, keepdims)
    }

    fn trilu(self: @Tensor<FP64x64>, upper: bool, k: i64) -> Tensor<FP64x64> {
        linalg::trilu::trilu(self, upper, k)
    }

    fn scatter(
        self: @Tensor<FP64x64>,
        updates: Tensor<FP64x64>,
        indices: Tensor<usize>,
        axis: Option<usize>,
        reduction: Option<usize>
    ) -> Tensor<FP64x64> {
        math::scatter::scatter(self, updates, indices, axis, reduction)
    }

    fn not(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        panic(array!['not supported!'])
    }


    fn gather_elements(
        self: @Tensor<FP64x64>, indices: Tensor<usize>, axis: Option<usize>
    ) -> Tensor<FP64x64> {
        math::gather_elements::gather_elements(self, indices, axis)
    }

    fn sequence_length(self: Array<Tensor<FP64x64>>) -> Tensor<u32> {
        math::sequence_length::sequence_length(self)
    }

    fn shrink(
        self: Tensor<FP64x64>, bias: Option<FP64x64>, lambd: Option<FP64x64>
    ) -> Tensor<FP64x64> {
        math::shrink::shrink(self, bias, lambd)
    }

    fn sequence_at(sequence: Array<Tensor<FP64x64>>, position: Tensor<i32>) -> Tensor<FP64x64> {
        math::sequence_at::sequence_at(sequence, position)
    }

    fn sequence_construct(tensors: Array<Tensor<FP64x64>>) -> Array<Tensor<FP64x64>> {
        math::sequence_construct::sequence_construct(tensors)
    }


    fn sequence_empty() -> Array<Tensor<FP64x64>> {
        math::sequence_empty::sequence_empty::<FP64x64>()
    }

    fn reduce_mean(
        self: @Tensor<FP64x64>,
        axes: Option<Span<usize>>,
        keepdims: Option<bool>,
        noop_with_empty_axes: Option<bool>
    ) -> Tensor<FP64x64> {
        math::reduce_mean::reduce_mean(self, axes, keepdims, noop_with_empty_axes)
    }

    fn reduce_min(
        self: @Tensor<FP64x64>,
        axes: Option<Span<usize>>,
        keepdims: Option<bool>,
        noop_with_empty_axes: Option<bool>
    ) -> Tensor<FP64x64> {
        math::reduce_min::reduce_min(self, axes, keepdims, noop_with_empty_axes)
    }

    fn pow(self: @Tensor<FP64x64>, other: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::pow::pow(self, other)
    }

    fn sequence_erase(
        sequence: Array<Tensor<FP64x64>>, position: Option<Tensor<i32>>
    ) -> Array<Tensor<FP64x64>> {
        math::sequence_erase::sequence_erase(sequence, position)
    }

    fn sequence_insert(
        self: Array<Tensor<FP64x64>>, tensor: @Tensor<FP64x64>, position: Option<Tensor<i32>>
    ) -> Array<Tensor<FP64x64>> {
        math::sequence_insert::sequence_insert(self, tensor, position)
    }

    fn is_inf(
        self: @Tensor<FP64x64>, detect_negative: Option<u8>, detect_positive: Option<u8>
    ) -> Tensor<bool> {
        math::is_inf::is_inf(self, detect_negative, detect_positive)
    }

    fn is_nan(self: @Tensor<FP64x64>) -> Tensor<bool> {
        math::is_nan::is_nan(self)
    }

    fn concat_from_sequence(
        sequence: Array<Tensor<FP64x64>>, axis: i32, new_axis: Option<usize>
    ) -> Tensor<FP64x64> {
        math::concat_from_sequence::concat_from_sequence(sequence, axis, new_axis)
    }

    fn gather_nd(self: @Tensor<FP64x64>, indices: Tensor<usize>, batch_dims: Option<usize>) -> Tensor<FP64x64> {
        math::gather_nd::gather_nd(self, indices, batch_dims)
    }
    
    fn reduce_log_sum(self: @Tensor<FP64x64>, axis: usize, keepdims: bool) -> Tensor<FP64x64> {
        math::reduce_log_sum::reduce_log_sum(self, axis, keepdims)
    }

    fn erf(self: @Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::erf::erf(*self)
    }

    fn unique(
        self: @Tensor<FP64x64>, axis: Option<usize>, sorted: Option<bool>
    ) -> (Tensor<FP64x64>, Tensor<i32>, Tensor<i32>, Tensor<i32>) {
        manipulation::unique::unique(self, axis, sorted)
    }
}

/// Implements addition for `Tensor<FP64x64>` using the `Add` trait.
impl FP64x64TensorAdd of Add<Tensor<FP64x64>> {
    /// Adds two `Tensor<FP64x64>` instances element-wise.
    ///
    /// # Arguments
    /// * `lhs` - The first tensor.
    /// * `rhs` - The second tensor.
    ///
    /// # Returns
    /// * A `Tensor<FP64x64>` instance representing the result of the element-wise addition.
    fn add(lhs: Tensor<FP64x64>, rhs: Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::arithmetic::add(@lhs, @rhs)
    }
}

/// Implements subtraction for `Tensor<FP64x64>` using the `Sub` trait.
impl FP64x64TensorSub of Sub<Tensor<FP64x64>> {
    /// Subtracts two `Tensor<FP64x64>` instances element-wise.
    ///
    /// # Arguments
    /// * `lhs` - The first tensor.
    /// * `rhs` - The second tensor.
    ///
    /// # Returns
    /// * A `Tensor<FP64x64>` instance representing the result of the element-wise subtraction.
    fn sub(lhs: Tensor<FP64x64>, rhs: Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::arithmetic::sub(@lhs, @rhs)
    }
}

/// Implements multiplication for `Tensor<FP64x64>` using the `Mul` trait.
impl FP64x64TensorMul of Mul<Tensor<FP64x64>> {
    /// Multiplies two `Tensor<FP64x64>` instances element-wise.
    ///
    /// # Arguments
    /// * `lhs` - The first tensor.
    /// * `rhs` - The second tensor.
    ///
    /// # Returns
    /// * A `Tensor<FP64x64>` instance representing the result of the element-wise multiplication.
    fn mul(lhs: Tensor<FP64x64>, rhs: Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::arithmetic::mul(@lhs, @rhs)
    }
}

/// Implements division for `Tensor<FP64x64>` using the `Div` trait.
impl FP64x64TensorDiv of Div<Tensor<FP64x64>> {
    /// Divides two `Tensor<FP64x64>` instances element-wise.
    ///
    /// # Arguments
    /// * `lhs` - The first tensor.
    /// * `rhs` - The second tensor.
    ///
    /// # Returns
    /// * A `Tensor<FP64x64>` instance representing the result of the element-wise division.
    fn div(lhs: Tensor<FP64x64>, rhs: Tensor<FP64x64>) -> Tensor<FP64x64> {
        math::arithmetic::div(@lhs, @rhs)
    }
}

/// Implements partial equal for two `Tensor<FP64x64>` using the `PartialEq` trait.
impl FP64x64TensorPartialEq of PartialEq<Tensor<FP64x64>> {
    fn eq(lhs: @Tensor<FP64x64>, rhs: @Tensor<FP64x64>) -> bool {
        tensor_eq(*lhs, *rhs)
    }

    fn ne(lhs: @Tensor<FP64x64>, rhs: @Tensor<FP64x64>) -> bool {
        !tensor_eq(*lhs, *rhs)
    }
}

impl FP64x64TryIntoI8 of TryInto<FP64x64, i8> {
    fn try_into(self: FP64x64) -> Option<i8> {
        Option::Some(i8 { mag: (self.mag / ONE).try_into().unwrap(), sign: self.sign })
    }
}

impl TensorI8IntoTensorFP64x64 of Into<Tensor<i8>, Tensor<FP64x64>> {
    fn into(self: Tensor<i8>) -> Tensor<FP64x64> {
        tensor_i8_to_tensor_fp64x64(@self)
    }
}

/// Implements partial ord for two `Tensor<FP64x64>` using `PartialOrd` trait.
impl FP64x64TensorPartialOrd of PartialOrd<Tensor<FP64x64>> {
    #[inline(always)]
    fn ge(lhs: Tensor<FP64x64>, rhs: Tensor<FP64x64>) -> bool {
        return SpanPartialOrd::ge(lhs.data, rhs.data);
    }

    #[inline(always)]
    fn gt(lhs: Tensor<FP64x64>, rhs: Tensor<FP64x64>) -> bool {
        return SpanPartialOrd::gt(lhs.data, rhs.data);
    }

    #[inline(always)]
    fn le(lhs: Tensor<FP64x64>, rhs: Tensor<FP64x64>) -> bool {
        return SpanPartialOrd::le(lhs.data, rhs.data);
    }

    #[inline(always)]
    fn lt(lhs: Tensor<FP64x64>, rhs: Tensor<FP64x64>) -> bool {
        return SpanPartialOrd::lt(lhs.data, rhs.data);
    }
}

// Internals

const PRECISION: u128 = 75497; // 0.009

fn relative_eq(lhs: @FP64x64, rhs: @FP64x64) -> bool {
    let diff = *lhs - *rhs;

    let rel_diff = if *lhs.mag != 0 {
        (diff / *lhs).mag
    } else {
        diff.mag
    };

    rel_diff <= PRECISION
}

fn tensor_eq(mut lhs: Tensor<FP64x64>, mut rhs: Tensor<FP64x64>,) -> bool {
    let mut is_eq = true;

    loop {
        if lhs.shape.len() == 0 || !is_eq {
            break;
        }

        is_eq = lhs.shape.pop_front().unwrap() == rhs.shape.pop_front().unwrap();
    };

    if !is_eq {
        return false;
    }

    loop {
        if lhs.data.len() == 0 || !is_eq {
            break;
        }

        is_eq = relative_eq(lhs.data.pop_front().unwrap(), rhs.data.pop_front().unwrap());
    };

    return is_eq;
}

fn tensor_i8_to_tensor_fp64x64(x: @Tensor<i8>) -> Tensor<FP64x64> {
    let mut result_data = ArrayTrait::<FP64x64>::new();
    let mut data = *x.data;

    loop {
        result_data.append((*data.pop_front().unwrap()).into());

        if data.len() == 0 {
            break ();
        };
    };

    return TensorTrait::new(*x.shape, result_data.span());
}
