+ [Angular Validation Form Guide](https://angular.io/docs/ts/latest/cookbook/form-validation.html)
+ [`FormControl`, `FromGroup` and `FormBuilder`](#formcontrol-fromgroup)
+ [`FormsModule` vs `ReactiveFormsModule`](#formsmodule-vs-reactiveformsModule)
+ [`formGroupControl.setvalue` vs `formGroupControl.patchValue`](#formgroupcontrolsetvalue-vs-formgroupcontrolpatchvalue)
+ [Some notes](#notes)

### `FormControl`, `FromGroup` and `FormArray`
- [`FormControl`](https://angular.io/docs/ts/latest/api/forms/index/FormControl-class.html): Tracks the value and validation status of an individual form control.
  ```    
    constructor(formState?: any, validator?: ValidatorFn|ValidatorFn[], asyncValidator?: AsyncValidatorFn|AsyncValidatorFn[])
  ```

  Example:
  ```Javascript
    const ctrl = new FormControl('', Validators.required);
  ```
- [`FromGroup`](https://angular.io/docs/ts/latest/api/forms/index/FormGroup-class.html): Tracks the value and validity state of a group of FormControl instances. If one of the controls in a `FormArray` is invalid, the entire array becomes invalid.   
  ```
    constructor(controls: {[key: string]: AbstractControl}, validator?: ValidatorFn, asyncValidator?: AsyncValidatorFn)
  ```

  Examples:
  ```Javascript
  const form = new FormGroup({
    password: new FormControl('', Validators.minLength(2)),
    passwordConfirm: new FormControl('', Validators.minLength(2)),
  }, passwordMatchValidator);
  ```
- [`FormArray`](https://angular.io/docs/ts/latest/api/forms/index/FormArray-class.html) is a variant of `FormGroup`. _The only different is: `FormArray` data get serialized as an array, while `FormGroup` serialized as an object_.

   ```
   constructor(controls: AbstractControl[], validator?: ValidatorFn, asyncValidator?: AsyncValidatorFn)
   ```

   Example:
   ```Javascript
   const arr = new FormArray([
     new FormControl('Nancy', Validators.minLength(2)),
     new FormControl('Drew'),
   ]);
   ```

### `FormsModule` vs `ReactiveFormsModule`
- `FormsModule`: You mark up template with form elements, validation attributes and directives from _FormsModule_. At the runtime, Angular interprets the template and derives its form control model.
- **Reactive Forms**: You create form controls in code. You write the template with form elements, and _form..._ directives of `ReactiveFormsModule`. At the runtime, Angular binds the template elements to your control model based on your instructions.

### `formGroupControl.setvalue` vs `formGroupControl.patchValue`
- 

### Notes:
- `touched`: check if user has touched form control, and make changes.
- `dirty`: check if form control has changed.
- `AbstractControl`: is the base class for `FormControl`, `FormGroup`, and `FormArray`.
