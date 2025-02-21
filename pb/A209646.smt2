;; sequence(s): A209646
;; terms: 9 81 270 630 1215 2079 3276 4860 6885 9405 12474 16146 20475 25515 31320 37944 45441 53865 63270 73710
;; small program: loop(((y * y) - 2) + x, (1 + 2) * (1 + x), 1) + x
;; fast program: (1 + (x + x)) * ((((1 + x) * (2 + x)) div 2) * (1 + (2 * (2 + 2))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- (* y y) 2) x))))
(assert (forall ((x Int)) (= (g0 x) (* (+ 1 2) (+ 1 x)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ x x)) (* (divf (* (+ 1 x) (+ 2 x)) 2) (+ 1 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
